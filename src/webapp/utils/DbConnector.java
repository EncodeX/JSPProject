package webapp.utils;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Created by zz on 2015/5/8.
 * !!!!!!将各位本地的数据库信息覆盖在这里
 * Thank you!
 */
public class DbConnector {

    private static String dburl="localhost";
    private static String dbname= "project_db";
    private static String dbusername="root";
    private static String dbpassword="072FangJy_950426";

    private static Connection connection=null;

    public static Connection getConnection(){
        if(connection!=null)
            return connection;
        else{
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();

                connection =
                        DriverManager.getConnection("jdbc:mysql://"+dburl+"/"+dbname+"?" +
                                "user="+dbusername+"&password="+dbpassword);
            } catch (Exception ex) {
                System.err.println("数据库连接失败。");
                return null;
            }
            return connection;
        }
    }
}
