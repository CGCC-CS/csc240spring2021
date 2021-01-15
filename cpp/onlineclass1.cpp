#include<iostream>

using namespace std;

class Shape {
    protected:
        string type;

    public:
        Shape(string t="Shape") : type(t) {}  

        // non-virtual method
        void print() { cout << "I am a shape" << endl; }
        
        // virtual method
        virtual void printType() { cout << type << endl; }

        // pure virtual (abstract) methods
        virtual int area() = 0;
        virtual int perimeter() = 0;
};

class Rectangle : public Shape {
    private:
        int length;
        int width;
    public:
        Rectangle(int l, int w, string t="Rectangle") 
            : Shape(t), length(l), width(w) {}

        int area() { return length * width; }
        int perimeter() { return 2 * length + 2 * width; }
        void print() { cout << type << " length=" << length <<
                               " width=" << width << endl; }
        void printType() {
            if (length == width) {
                cout << "Square" << endl;
            }
            else {
                cout << type << endl;
            }
        }
};

int main() {

    // Shape s("MyShape");  // Can't instantiate an abstract class 
    Rectangle r1(5, 7);
    Rectangle * r2 = new Rectangle(4,3);
    Shape * sPtr = &r1;

    cout << "Rectangle r1:" << endl;
    r1.print();
    r1.printType();

    cout << endl << "Rectangle * r2:" << endl;
    r2->print();
    r2->printType();

    cout << endl << "Shape * Sptr is pointer " << endl;
    sPtr->print();
    sPtr->printType();

    return 0;
}
