/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rw.ofbmrs.passwordEncryption;

import java.math.BigInteger;
import java.security.MessageDigest;

/**
 *
 * 
 */
public class Encryption {
    public static String md5(String password){
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[]mDigest = md.digest(password.getBytes());
            BigInteger num = new BigInteger(1, mDigest);
            String hashString = num.toString(16);
            while(hashString.length() < 32){
                hashString += "0";
            }
            return hashString;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
