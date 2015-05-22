package webapp.model;

/**
 * Created by zz on 2015/5/15.
 */
public class Proposer {
    int userID;
    String userName;
    String userPwd;
    String name;
    String subClass;
    int subID;
    int recID;
    int recResult;
    int firCount;
    int firResult;
    int lasResult;

    public Proposer(int userID, String userName, String userPwd, String name, String subClass, int subID, int recID, int recResult, int firCount, int firResult, int lasResult) {
        this.userID = userID;
        this.userName = userName;
        this.userPwd = userPwd;
        this.name = name;
        this.subClass = subClass;
        this.subID = subID;
        this.recID = recID;
        this.recResult = recResult;
        this.firCount = firCount;
        this.firResult = firResult;
        this.lasResult = lasResult;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSubClass() {
        return subClass;
    }

    public void setSubClass(String subClass) {
        this.subClass = subClass;
    }

    public int getSubID() {
        return subID;
    }

    public void setSubID(int subID) {
        this.subID = subID;
    }

    public int getRecID() {
        return recID;
    }

    public void setRecID(int recID) {
        this.recID = recID;
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
