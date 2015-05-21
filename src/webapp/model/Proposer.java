package webapp.model;

/**
 * Created by y on 2015/5/21.
 */
public class Proposer { private int userID;
    private String userName;
    private String userPwd;
    private String name;
    private String subClass;
    private int subID;
    private int recID;
    private int recResult;
    private int firCount;
    private int firResult;
    private int lasResult;

    public Proposer(String subClass, int userID, String name) {
        this.subClass=subClass;
        this.userID=userID;
        this.name=name;
    }


    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getSubClass() {
        return subClass;
    }

    public void setSubClass(String subClass) {
        this.subClass = subClass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getRecID() {
        return recID;
    }

    public void setRecID(int recID) {
        this.recID = recID;
    }

    public int getSubID() {
        return subID;
    }

    public void setSubID(int subID) {
        this.subID = subID;
    }

    public int getRecResult() {
        return recResult;
    }

    public void setRecResult(int recResult) {
        this.recResult = recResult;
    }

    public int getFirCount() {
        return firCount;
    }

    public void setFirCount(int firCount) {
        this.firCount = firCount;
    }

    public int getFirResult() {
        return firResult;
    }

    public void setFirResult(int firResult) {
        this.firResult = firResult;
    }

    public int getLasResult() {
        return lasResult;
    }

    public void setLasResult(int lasResult) {
        this.lasResult = lasResult;
    }
}
