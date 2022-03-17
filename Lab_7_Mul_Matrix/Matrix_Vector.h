#ifndef MATRIX_MATRIX_VECTOR_H
#define MATRIX_MATRIX_VECTOR_H

#include <iostream>
#include <algorithm>
#include <xmmintrin.h>
#include <avxintrin.h>

class Matrix {
public:
    Matrix(int n) : size_(n) {
        matrix_ = new float *[size_];
        for (int i = 0; i < size_; ++i) {
            matrix_[i] = (float*)_mm_malloc(sizeof(float) * size_, 256);
            for (int j = 0; j < size_; ++j) {
                matrix_[i][j] = rand() % 10;
            }
        }
    }

    ~Matrix() {
        if (matrix_ != nullptr) {
            for (int i = 0; i < size_; ++i) {
                delete[] matrix_[i];
            }
            delete[] matrix_;
        }
    }

    Matrix(const Matrix& other) : Matrix(other.size_) {
        for (int i = 0; i < size_; ++i) {
            for (int j = 0; j < size_; ++j) {
                matrix_[i][j] = other.matrix_[i][j];
            }
        }
    }

    Matrix(Matrix&& other) {
        std::swap(matrix_, other.matrix_);
        std::swap(size_, other.size_);
    }

    static Matrix EMatrix(int dim) {
        Matrix res(dim);
        for (int i = 0; i < dim; ++i) {
            for (int j = 0; j < dim; ++j) {
                res.matrix_[i][j] = i == j ? 1 : 0;
            }
        }
        return res;
    }

    Matrix& operator=(Matrix& other) {
        size_ = other.size_;
        for (int i = 0; i < size_; ++i) {
            for (int j = 0; j < size_; ++i) {
                matrix_[i][j] = other.matrix_[i][j];
            }
        }
        return *this;
    }

    Matrix& operator=(Matrix&& other) {
        std::swap(size_, other.size_);
        std::swap(matrix_, other.matrix_);

        return *this;
    }

    Matrix operator*(const Matrix& other) const {
        Matrix result(size_);
        for(int i = 0; i < size_; ++i)
        {
            for(int j = 0; j < size_; ++j)
            {
                result.matrix_[i][j] = 0;
            }
        }
        for (int i = 0; i < size_; ++i) {
            __m256* r = (__m256*)result.matrix_[i];
            for (int k = 0; k < size_; ++k) {
                __m256* f = (__m256*)other.matrix_[k];
                __m256 s = _mm256_set1_ps(matrix_[i][k]);
                for (int j = 0; j < size_/4; ++j) {
                    r[j] = _mm256_add_ps(r[j], _mm256_mul_ps(s, f[j]));
                }
                for(int j = (size_/4)*4; j < size_; ++j) {
                    result.matrix_[i][j] += matrix_[i][k] * other.matrix_[k][j];
                }
            }
        }
        return result;
    }

    Matrix operator*(const float k) const {
        Matrix result(size_);
        for (int i = 0; i < size_; ++i) {
            __m256 *f, *r;
            __m256 s = _mm256_set_pd(k, k, k, k);
            f = (__m256*)matrix_[i];
            r = (__m256*)result.matrix_[i];
            for (int j = 0; j < size_ / 4; ++j) {
                r[j] = _mm256_mul_ps(f[j], s);
            }
            for (int j = (size_ / 4) * 4; j < size_; ++j) {
                result.matrix_[i][j] = matrix_[i][j] * k;
            }
        }
        return result;
    }

    Matrix operator+(const Matrix& other) {
        Matrix result(size_);
        for (int i = 0; i < size_; ++i) {
            __m256 *f, *s, *r;
            f = (__m256*)matrix_[i];
            s = (__m256*)other.matrix_[i];
            r = (__m256*)result.matrix_[i];
            for (int j = 0; j < size_/4; ++j) {
                r[j] = _mm256_add_ps(f[j], s[j]);
            }
            for(int j = (size_/4)*4; j < size_; ++j) {
                result.matrix_[i][j] = matrix_[i][j] + other.matrix_[i][j];
            }
        }
        return result;
    }

    Matrix Transposed() const {
        Matrix res(size_);
        for (int i = 0; i < size_; ++i) {
            for (int j = 0; j < size_; ++j) {
                res.matrix_[i][j] = matrix_[j][i];
            }
        }
        return res;
    }

    Matrix ReverseMatrix(const int& m) const {
        Matrix reverse(size_);
        reverse = Matrix::EMatrix(size_);
        Matrix b(size_), r(size_);
        b = Transposed() * (1 / MaxHorizonSum() / MaxVerticalSum());
        r = Matrix::EMatrix(size_) + b * (*this) * -1;
        Matrix rc = r;
        for(int i = 0; i < m; ++i) {
            reverse = reverse + r;
            r = r * rc;
        }
        return reverse;
    }

    void Print() const {
        for (int i = 0; i < size_; ++i) {
            for (int j = 0; j < size_; ++j) {
                std::cout << matrix_[i][j] << ' ';
            }
            std::cout << std::endl;
        }
    }

private:
    float** matrix_ = nullptr;
    int size_;

    float MaxVerticalSum() const {
        float maxSum = 0.0;
        if (matrix_ == nullptr)
            return maxSum;

        for (int i = 0; i < size_; ++i) {
            float sum = 0;
            for (int j = 0; j < size_; ++j) {
                sum += std::abs(matrix_[j][i]);
            }
            maxSum = std::max(maxSum, sum);
        }
        return maxSum;
    }

    float MaxHorizonSum() const {
        float maxSum = 0.0;
        if (matrix_ == nullptr)
            return maxSum;

        for (int i = 0; i < size_; ++i) {
            float sum = 0;
            for (int j = 0; j < size_; ++j) {
                sum += std::abs(matrix_[i][j]);
            }
            maxSum = std::max(maxSum, sum);
        }
        return maxSum;
    }
};

#endif //MATRIX_MATRIX_VECTOR_H
