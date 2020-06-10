package com.dest.controller;

import java.io.UnsupportedEncodingException;
import java.util.Base64;

import com.dest.entity.Item;

public class Encrypted
{
	

	public static String encode(String value) throws UnsupportedEncodingException
	{
		Base64.Encoder e= Base64.getEncoder();
		return e.encodeToString(value.getBytes("utf-8"));
		
	}
	public static String decode(String encrypted) throws UnsupportedEncodingException
	{
		byte [] b=Base64.getDecoder().decode(encrypted);
		return new String (b ,"utf-8");
		
	}
	
	public static void main(String[] args) throws UnsupportedEncodingException 
	{
		System.out.println(encode("Mohan-Singh="));
		System.out.println(decode("RGVzdC1GYW4tMDAwMDI="));

	}

}
