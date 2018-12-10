#include <windows.h>
#include <fstream>
#include "com_amos_file_manager_File.h"
#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <stdio.h>

using namespace std;

FILE * f;
//Test t;

/*
 * Class:     com_amos_file_manager_File
 * Method:    delete
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_com_amos_file_manager_File_delete0(JNIEnv *env, jobject thisObj,jstring s){
	const char *res =env->GetStringUTFChars(s, 0);
	//if(
			remove(res);
	//) {
		//jclass cl = env->FindClass("java/io/IOException");
		  //  env->ThrowNew(cl,"error from JNI");

	//}
}


/*
 * Class:     com_amos_file_manager_File
 * Method:    write
 * Signature: ([B)V
 */
JNIEXPORT void JNICALL Java_com_amos_file_manager_File_write0(JNIEnv *env, jobject thisObj,jstring s){

	const char *text =env->GetStringUTFChars(s, 0);
printf("%s",text);

	//if (text < 'a') text = ' ';
	//fwrite (&text ,1 , sizeof(text) , f);
	//fwrite(optr->og.body, 1, optr->og.body_len, f);


}


/*
 * Class:     com_amos_file_manager_File
 * Method:    creat0
 * Signature: (Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_com_amos_file_manager_File_creat0(JNIEnv *env, jobject thisObj, jstring s){

	const char *res =env->GetStringUTFChars(s, 0);
   f = fopen ( res , "w" );
	//fout.close();
}


/*
 * Class:     com_amos_file_manager_File
 * Method:    close0
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_com_amos_file_manager_File_close0(JNIEnv *env, jobject thisObj){
	fclose(f);
}



