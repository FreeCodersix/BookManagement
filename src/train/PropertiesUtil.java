package train;

import java.io.InputStream;
import java.util.Arrays;
import java.util.Properties;

public class PropertiesUtil {
    private static String FILE = "raky/train/jdbc.properties";
    private  PropertiesUtil(){}

    public static String[] getArrayByProperties() throws Exception {

        Properties properties = new Properties();


        InputStream is = PropertiesUtil.class.getClassLoader().getResourceAsStream(FILE);

        properties.load(is);


        String driver = properties.getProperty("jdbc.driver");
        String url = properties.getProperty("jdbc.url");
        String username = properties.getProperty("jdbc.username");
        String password = properties.getProperty("jdbc.password");

        return new String[] {driver,url,username,password};
    }


    public static String[] getArrayByProperties(String config) throws Exception {
        if(config ==null){
            return getArrayByProperties();
        }
        FILE = config;
        return getArrayByProperties();
    }

    public static void main(String[] args) throws Exception {
        String[] configs = PropertiesUtil.getArrayByProperties();
        System.out.println(Arrays.toString(configs));
    }

}
