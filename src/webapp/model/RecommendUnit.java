package webapp.model;

/**
 * Created by zz on 2015/5/23.
 */
public class RecommendUnit {
    int id;
    String username;
    String password;
    int quota;

    public RecommendUnit(String username, String password, int quota) {
        this.username = username;
        this.password = password;
        this.quota = quota;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getQuota() {
        return quota;
    }

    public void setQuota(int quota) {
        this.quota = quota;
    }
}
