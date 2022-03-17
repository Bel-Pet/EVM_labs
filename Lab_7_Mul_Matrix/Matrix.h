#ifndef UNTITLED1_MATRIX_H
#define UNTITLED1_MATRIX_H

#include <iostream>
#include <algorithm>

class Matrix {
public:
    explicit Matrix(int n) : size_(n) {
        matrix_ = new float*[size_];
        for (int i = 0; i < size_; ++i) {
            matrix_[i] = new float[size_];
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

   Matrix(Matrix&& other)  noexcept {
        std::swap(matrix_, other.matrix_);
        std::swap(size_, other.size_);
    }

    void swap(Matrix& other) {
        std::swap(size_, other.size_);
        std::swap(matrix_, other.matrix_);
    }

    static Matrix GetEMatrix(int dim) {
        Matrix res(dim);
        for (int i = 0; i < dim; ++i) {
            for (int j = 0; j < dim; ++j) {
                res.matrix_[i][j] = 0;
                if (i == j)
                    res.matrix_[i][j] = 1;
            }
        }
        return res;
    }

    Matrix& operator=(const Matrix& other) {
        if(&other != this) {
            size_ = other.size_;
            for (int i = 0; i < size_; ++i) {
                for (int j = 0; j < size_; ++i) {
                    matrix_[i][j] = other.matrix_[i][j];
                }
            }
        }
        return *this;
    }

    Matrix& operator=(Matrix&& other)  noexcept {
        std::swap(size_, other.size_);
        std::swap(matrix_, other.matrix_);

        return *this;
    }

    Matrix operator*(const Matrix& other) const {
        Matrix result(size_);

        for (int i = 0; i < size_; ++i) {
            for (int j = 0; j < size_; ++j) {
                result.matrix_[i][j] = 0;
            }
        }

        for (int i = 0; i < size_; ++i) {
            for (int k = 0; k < size_; ++k) {
                for (int j = 0; j < size_; ++j) {
                    result.matrix_[i][k] += matrix_[i][j] * other.matrix_[j][k];
                }
            }
        }
        return result;
    }

    Matrix operator*(const float& k) const {
        Matrix result(size_);
        for (int i = 0; i < size_; ++i) {
            for (int j = 0; j < size_; ++j) {
                result.matrix_[i][j] = matrix_[i][j] * k;
            }
        }
        return result;
    }

    Matrix operator/(const float& k) const {
        Matrix result(size_);
        for (int i = 0; i < size_; ++i) {
            for (int j = 0; j < size_; ++j) {
                result.matrix_[i][j] = matrix_[i][j] / k;
            }
        }
        return result;
    }

    Matrix operator+(const Matrix& other) const {
        Matrix result(size_);
        for (int i = 0; i < size_; ++i) {
            for (int j = 0; j < size_; ++j) {
                result.matrix_[i][j] = matrix_[i][j] + other.matrix_[i][j];
            }
        }
        return result;
    }

    Matrix operator-(const Matrix& other) const {
        Matrix result(size_);
        for (int i = 0; i < size_; ++i) {
            for (int j = 0; j < size_; ++j) {
                result.matrix_[i][j] = matrix_[i][j] - other.matrix_[i][j];
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

    /*Matrix ReverseMatrix(const int& m) const {
        Matrix reverse(Matrix::GetEMatrix(size_));
        Matrix b(Transposed() / (MaxHorizonSum() * MaxVerticalSum()));
        Matrix r(Matrix::GetEMatrix(size_) - (b * (*this)));
        Matrix rc(r);

        for(int i = 0; i < m; i++) {
            Matrix rev(reverse + r);
            reverse.swap(rev);
            Matrix t(r * rc);
            r.swap(t);
        }
        return reverse * b;
    }*/

    void Print() const {
        for (int i = 0; i < size_; ++i) {
            for (int j = 0; j < size_; ++j) {
                std::cout << matrix_[i][j] << ' ';
            }
            std::cout << std::endl;
        }
    }

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

private:
    float** matrix_ = nullptr;
    int size_;
};

#endif //UNTITLED1_MATRIX_H
