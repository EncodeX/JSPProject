package webapp.model;

/**
 * Created by zz on 2015/5/15.
 */
public class SubjectGroup {
    int groID;
    String groName;
    int subNum;

    public SubjectGroup(int groID, String groName, int subNum) {
        this.groID = groID;
        this.groName = groName;
        this.subNum = subNum;
    }

    public int getGroID() {
        return groID;
    }

    public void setGroID(int groID) {
        this.groID = groID;
    }

    public String getGroName() {
        return groName;
    }

    public void setGroName(String groName) {
        this.groName = groName;
    }

    public int getSubNum() {
        return subNum;
    }

    public void setSubNum(int subNum) {
        this.subNum = subNum;
    }
}
