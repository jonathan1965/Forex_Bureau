
import java.text.SimpleDateFormat;
import org.hibernate.Session;
import rw.ofbmrs.entities.Administrator;
import rw.ofbmrs.hibernate.util.HibernateUtility;
import rw.ofbmrs.passwordEncryption.Encryption;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author kay
 */
public class Test {

    public static void main(String[] args) {
        try {
            Administrator admin = new Administrator();
            admin.setDateOfBirth(new SimpleDateFormat("yyyy-MM-dd").parse("1996-11-21"));
            admin.setEmail("jonakarisa@gmail.com");
            admin.setFirstName("Kalisa");
            admin.setGender("Male");
            admin.setLastName("Jonathan");
            admin.setPassword(Encryption.md5("eljo071965"));
            admin.setPhone("0788393331");
            admin.setRole("Admin");
            admin.setStatus("Active");
            admin.setUsername("jokaykal");
            admin.create();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
