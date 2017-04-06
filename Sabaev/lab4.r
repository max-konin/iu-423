#include <iostream>
#include <cstdlib>
#include <fstream>
#include <cmath>
#include <algorithm>
#include <vector>

using namespace std;

double Pi[100];

int fn(double a){
	for(int i = 0; i < 100; i++)
		if (a > 0 && a < Pi[i])
			return i;
		else if(a >= Pi[i] && a < Pi[i + 1])
			return i;
		return 0;
	}
	
int main(){
	vector <int> arr30, arr300;
	double arr[1000], MxD = 0, DxD = 0, kv = 0;
	int a, i, sum = 0;
	srand(time(NULL));
	Pi[0] = 0.2;
	ofstream fout("lab3.ods");
	
	for (int i = 1; i < 100; i++)
		Pi[i] = Pi[i - 1] + 0.8/99;
		
	for (int i = 0; i < 1000; i++){
			double a = drand48();
			fout << fn(a) << endl;
			arr[i] = fn(a);
	}		
	fout.close();
	i = 0;
	while(i < 30){
		a = rand() % 1000;
		if (find(arr30.begin(), arr30.end(), arr[a]) == arr30.end()){	
			arr30.push_back(arr[a]);
			i++;
		}
	}
	
	for (int i = 0; i < 300; i++){
		a = rand() % 1000;
		arr300.push_back(arr[a]);
	}
	
	double Mx30, Mx300, Dx30 = 0, Dx300 = 0;
	
	for (i = 0; i < 30; i++)
		sum += arr30[i];	
	Mx30 = sum / 30;
	
	sum = 0;
	for (i = 0; i < 300; i++)
		sum += arr300[i];
	Mx300 = sum / 300;
	
	sum = 0;
	for(i = 0; i < 30; i++)
		sum += (pow((arr30[i] - Mx30), 2));
	Dx30 = sum / 30;
	
	sum = 0;
	for(i = 0; i < 300; i++)
		sum += (pow((arr300[i] - Mx300), 2));
	Dx300 = sum / 300;
	
	for (i = 1; i < 100; i++)
		kv += pow(i, 2) * (0.8/99);
		
	for (i = 1; i < 100; i++)
		MxD += i * (0.8/99);	
		
	DxD = kv - pow(MxD, 2);
	cout << "Mx30 = " << Mx30 << ";" << endl;
	cout << "Mx300 = " << Mx300 << ";" << endl;
	cout << "Dx30 = " << Dx30 << ";" << endl;
	cout << "Dx300 = " << Dx300 << ";" << endl;
	cout << "MxD = "<< MxD << ";" << endl;
	cout << "DxD = "<< DxD << ";" << endl;
	return 0;
}
