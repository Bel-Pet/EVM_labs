#include "Matrix.h"

int main()
{
    int n, m;
    std::cin >> n >> m;
    Matrix a(n);
    a.Print();
    std::cout << std::endl;
    std::cout << std::endl;
    Matrix reverse(n);
    reverse = Matrix::GetEMatrix(n);
    Matrix b(n);
    b = a.Transposed() / (a.MaxHorizonSum() * a.MaxVerticalSum());
    Matrix r(Matrix::GetEMatrix(n) - (b * a));
    Matrix rc(r);

    for(int i = 0; i < m; i++) {
        Matrix rev(reverse + r);
        reverse.swap(rev);
        Matrix t(r * rc);
        r.swap(t);
    }

    std::cout << std::endl;
    std::cout << std::endl;
    reverse.Print();
    std::cout << std::endl;
    std::cout << std::endl;
    (a * (reverse * b)).Print();

    return 0;
}
