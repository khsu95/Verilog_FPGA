#include <iostream>
#include <string>

using namespace std;

int main() {

	cout << "`timescale 1ns/ 1ps" << endl << endl;
	cout << "module Signed_Array_Multiplier_32(a, b, mul);\ninput [31:0] a;\ninput[31:0] b;\noutput[63:0] mul;" << endl;



	cout << "//Declare Wire" << endl;
	
	//Wire Partial Product
	cout << "//Wire Partial Product " << endl;
	cout << "wire [31:0] ";
	for (int i = 0;i < 32;i++) {
		string token = "pwire_";
		if (i >= 10)	token.push_back('0' + (i / 10));
		token.push_back('0' + i % 10);
		if (i != 31)	token += ", ";
		else token += ";";
		cout << token;
	}
	cout << endl;

	//Wire Stage-to-Stage
	cout << "//Stage-to-Stage wire" << endl;
	for (int i = 1;i < 32;i++) {
		string token = "wire [";
		//wire size
		string tar = "";
		int j = 62 - i;
		if (j >= 10) tar.push_back('0' + (j / 10));
		tar.push_back('0' + (j % 10));
		token = token + tar + ":0] swire_";

		//swire
		if (i >= 10)	token.push_back('0' + (i / 10));
		token.push_back('0' + i % 10);
		token += ";";
		cout << token;
	}
	cout << endl;

	//Wire Carry Propagation
	cout << "//Carry Propagation wire" << endl;
	cout << "//Stage-to-Stage wire" << endl;
	for (int i = 1;i < 32;i++) {
		string token = "wire [";
		//wire size
		string tar = "";
		int j = 63 - i;
		if (j >= 10) tar.push_back('0' + (j / 10));
		tar.push_back('0' + (j % 10));
		token = token + tar + ":0] cwire_";


		//cwire
		if (i >= 10)	token.push_back('0' + (i / 10));
		token.push_back('0' + i % 10);
		token += "; ";
		cout << token;
	}
	cout << endl;
	

	string stage_old="0";
	cout << endl;
	for (int i = 1;i < 32;i++) { //Stage i

		string stage = "";
		if (i >= 10)	stage.push_back('0' + (i / 10));
		stage.push_back('0' + i % 10);
		cout <<"//Stage"<< stage << " Partial Mul" << endl;

		if(i==1)	cout << "ha f" << stage << "(pwire_" << stage << "[0], pwire_" << stage_old << "[1], mul[" << stage << "], cwire_" << stage << "[0]);" << endl;
		else if (i != 31)	cout << "ha f" << stage << "(pwire_" << stage << "[0], swire_" << stage_old << "[0], mul[" << stage << "], cwire_" << stage << "[0]);" << endl;
		else cout << "fa f" << stage << "(pwire_" << stage << "[0], swire_" << stage_old << "[0], 1'b1, mul[" << stage << "], cwire_" << stage << "[0]);" << endl;
		
		string rd_pre = "0";

		//Partial
		for (int j = 1;j < 32;j++) { //Partial Multiplier
			string token = "fa f";
			string rd_next = "";
			
			string rd = "";
			if (j >= 10)	rd.push_back('0' + (j / 10));
			rd.push_back('0' + (j % 10));

			if (j >= 9)	rd_next.push_back('0' + ((j + 1) / 10));
			rd_next.push_back('0' + ((j + 1) % 10));

			token = token + stage + "_" + rd;

			//Parameter
			token = token + " (pwire_" + stage+"["+rd+"], ";
			if(i!=1)	token = token + "swire_" + stage_old + "[" + rd + "], ";
			else	token = token + "pwire_0[" + rd_next + "], ";
			token = token + "cwire_" + stage + "[" + rd_pre + "], ";
			if (i == 31) {
				string tar = "";
				tar.push_back('0' + ((i + j) / 10));
				tar.push_back('0' + ((i + j) % 10));
				token = token + "mul[" + tar + "], ";
			}
			else token = token + "swire_" + stage + "[" + rd_pre + "], ";
			token = token + "cwire_" + stage + "[" + rd + "]); ";
			cout << token << endl;

			rd_pre = rd;
			
		}

		//Padding
		cout << endl;
		cout << "//Stage"<<stage<<"Padding" << endl;
		for (int j = 1;j < (31 - i + 2);j++) {
			string token = "fa f";
			string rd_next = "";

			string rd = "";
			if (j >= 10)	rd.push_back('0' + (j / 10));
			rd.push_back('0' + (j % 10));
			token = token + stage + "__" + rd;

			if (j >= 9)	rd_next.push_back('0' + ((j + 1) / 10));
			rd_next.push_back('0' + ((j + 1) % 10));

			string rd_comp_next = "";
			rd_comp_next.push_back('0' + ((j + 31 + 1) / 10));
			rd_comp_next.push_back('0' + ((j + 31 + 1) % 10));

			string rd_comp_pre = "";
			rd_comp_pre.push_back('0' + ((j + 31 - 1) / 10));
			rd_comp_pre.push_back('0' + ((j + 31 - 1) % 10));

			string rd_comp_now = "";
			rd_comp_now.push_back('0' + ((j + 31 ) / 10));
			rd_comp_now.push_back('0' + ((j + 31 ) % 10));

			//Parameter
			token = token + " (pwire_" + stage + "[31], ";
			if (i != 1)	token = token + "swire_" + stage_old + "[" + rd_comp_now + "], ";
			else token = token + "pwire_0[31], ";
			token = token + "cwire_" + stage + "[" + rd_comp_pre + "], ";

			if (i == 31) {
				string tar = "63";
				token = token + "mul[" + tar + "], ";
			}
			else	token = token + "swire_" + stage + "[" + rd_comp_pre + "], ";
			token = token + "cwire_" + stage + "[" + rd_comp_now + "]);";
			cout << token << endl;

			rd_pre = rd;
		}
		cout << endl;
		stage_old = stage;
	}

	cout << endl;
	//Assign
	cout << "assign mul[0] = a[0] & b[0];" << endl;
	for (int i = 0;i < 31;i++) {
		string token = "assign pwire_";
		if (i >= 10)	token.push_back('0' + (i / 10));
		token.push_back('0' + i % 10);
		token += " = b[";
		if (i >= 10)	token.push_back('0' + (i / 10));
		token.push_back('0' + i % 10);
		token += "] ? a : 0;";

		cout << token << endl;
	}

	cout << "assign pwire_31 = b[31] ? ~a : 0;" << endl;

	cout << "endmodule";
	int a;
	cin >> a;
	return a;
}