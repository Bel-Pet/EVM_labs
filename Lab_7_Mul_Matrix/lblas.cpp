#include <cblas.h>
#include <iostream>
#include <algorithm>

float GetMaxVerticalSum(float* matrix, int dim)
{
	float maxSum = -1e5;
	for (int i = 0; i < dim; ++i)
	{
		float sum = 0;
		for (int j = 0; j < dim; ++j)
		{
			sum += std::abs(matrix[j*dim + i]);
		}
		maxSum = std::max(maxSum, sum);
	}
	return maxSum;
}

float GetMaxHorizontalSum(float* matrix, int dim)
{
	float maxSum = -1e5;
	for (int i = 0; i < dim; ++i)
	{
		float sum = 0;
		for (int j = 0; j < dim; ++j)
		{
			sum += std::abs(matrix[i*dim + j]);
		}
		maxSum = std::max(maxSum, sum);
	}
	return maxSum;
}

int main()
{
	int n, m;
	std::cin >> n >> m;
	float* a = new float[n * n];
	for(int i = 0; i < n; ++i)
	{
		for(int j = 0; j < n; ++j)
		{
			a[i*n + j] = rand() % 10;
		}
	}
	float* b = new float[n*n];
	float maxVert = GetMaxVerticalSum(a, n);
	float maxHor = GetMaxHorizontalSum(a, n);
	for (int i = 0; i < n; ++i)
	{
		for (int j = 0; j < n; ++j)
		{
			b[i * n + j] = a[j*n + i] / maxHor / maxVert;
		}
	}

	float* e = new float[n*n];
	for (int i = 0; i < n; ++i)
	{
		for (int j = 0; j < n; ++j)
		{
			e[i*n + j] = i == j ? 1 : 0;
		}
	}
	float* r = new float[n*n];
	cblas_scopy(n*n, e, 1, r, 1);

	cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, n, n, n, -1, b, n, a, n, 1, r, n);

	float* rc = new float[n*n];
	cblas_scopy(n*n, r, 1, rc, 1);

	float* reverse = new float[n * n];
	cblas_scopy(n*n, e, 1, reverse, 1);
	
	for(int i = 0; i < m; ++i)
	{
		cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, n, n, n, 1, e, n, r, n, 1, reverse, n);
		float* t = new float[n*n];
		cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, n, n, n, 1, r, n, rc, n, 0, t, n);
		delete []r;
		r = t;
	}

	cblas_scopy(n*n, reverse, 1, e, 1);
	cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, n, n, n, 1, e, n, b, n, 0, reverse, n);

	cblas_scopy(n*n, reverse, 1, e, 1);
	cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, n, n, n, 1, e, n, a, n, 0, reverse, n);
	for (int i = 0; i < n; ++i)
	{
		for (int j = 0; j < n; ++j)
		{
			std::cout << reverse[i * n + j] << ' ';
		}
		std::cout << std::endl;
	}
	return 0;
}