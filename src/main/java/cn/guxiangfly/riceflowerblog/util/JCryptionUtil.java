package cn.guxiangfly.riceflowerblog.util;

import org.bouncycastle.jce.provider.BouncyCastleProvider;

import javax.crypto.Cipher;
import java.security.*;
import java.security.interfaces.RSAPublicKey;


public class JCryptionUtil {  
      
    public static final Provider provider = new BouncyCastleProvider();
    /** 
     * Constructor 
     */  
    public JCryptionUtil() throws Exception {
        Security.addProvider(provider);
    }  
  
    /**
     * @param keyLength 
     *            length of key 
     * @return KeyPair object
     */  
    public KeyPair generateKeypair(int keyLength) throws Exception {
        try {  
            KeyPairGenerator kpg;
            try {  
                kpg = KeyPairGenerator.getInstance("RSA");
            } catch (Exception e) {
                kpg = KeyPairGenerator.getInstance("RSA",provider);
            }  
            kpg.initialize(keyLength);  
            KeyPair keyPair = kpg.generateKeyPair();
            return keyPair;  
        } catch (NoSuchAlgorithmException e1) {
            throw new RuntimeException("RSA algorithm not supported", e1);
        } catch (Exception e) {
            throw new Exception("other exceptions", e);
        }  
    }  
  
    /**
     * @param keys 
     *            RSA keys 
     * @return decrypted text 
     * @throws RuntimeException
     *             if the RSA algorithm not supported or decrypt operation failed 
     */  
    public static String decrypt(String encrypted, KeyPair keys) throws Exception {
        Cipher dec;
        try {  
            try {  
                dec = Cipher.getInstance("RSA/NONE/NoPadding");
            } catch (Exception e) {
                dec = Cipher.getInstance("RSA/NONE/NoPadding",provider);
            }  
            dec.init(Cipher.DECRYPT_MODE, keys.getPrivate());
        } catch (GeneralSecurityException e) {
            throw new RuntimeException("RSA algorithm not supported", e);
        }  
        String[] blocks = encrypted.split("\\s");
        StringBuffer result = new StringBuffer();
        try {  
            for (int i = blocks.length - 1; i >= 0; i--) {  
                byte[] data = hexStringToByteArray(blocks[i]);  
                byte[] decryptedBlock = dec.doFinal(data);  
                result.append(new String(decryptedBlock,"UTF8"));
            }  
        } catch (GeneralSecurityException e) {
            throw new RuntimeException("Decrypt error", e);
        }  
        /** 
         * Some code is getting added in first 2 digits with Jcryption need to investigate 
         */  
        return result.reverse().toString().substring(2);  
    }  
  
  
    /** 
     * Return public RSA key modulus 
     *  
     * @param keyPair 
     *            RSA keys 
     * @return modulus value as hex string 
     */  
    public static String getPublicKeyModulus(KeyPair keyPair) {
        RSAPublicKey publicKey = (RSAPublicKey) keyPair.getPublic();
        return publicKey.getModulus().toString(16);  
    }  
  
    /** 
     * Return public RSA key exponent 
     *  
     * @param keyPair 
     *            RSA keys 
     * @return public exponent value as hex string 
     */  
    public static String getPublicKeyExponent(KeyPair keyPair) {
        RSAPublicKey publicKey = (RSAPublicKey) keyPair.getPublic();
        return publicKey.getPublicExponent().toString(16);  
    }  
  
    /** 
     * Max block size with given key length 
     *  
     * @param keyLength 
     *            length of key 
     * @return numeber of digits 
     */  
    public static int getMaxDigits(int keyLength) {  
        return ((keyLength * 2) / 16) + 3;  
    }  
  
    /** 
     * Convert byte array to hex string 
     *  
     * @param bytes 
     *            input byte array 
     * @return Hex string representation 
     */  
    public static String byteArrayToHexString(byte[] bytes) {
        StringBuffer result = new StringBuffer();
        for (int i = 0; i < bytes.length; i++) {  
            result.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16)
                    .substring(1));  
        }  
        return result.toString();  
    }  
  
    /** 
     * Convert hex string to byte array 
     *  
     * @param data 
     *            input string data 
     * @return bytes 
     */  
    public static byte[] hexStringToByteArray(String data) {
        int k = 0;  
        byte[] results = new byte[data.length() / 2];  
        for (int i = 0; i < data.length();) {  
            results[k] = (byte) (Character.digit(data.charAt(i++), 16) << 4);
            results[k] += (byte) (Character.digit(data.charAt(i++), 16));
            k++;  
        }  
        return results;  
    }  
  
}  