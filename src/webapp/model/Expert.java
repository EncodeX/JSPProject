package webapp.model;

/**
 * Created by Administrator on 2015/5/7.
 */
public class Expert {
    private String expName;
    private String expPwd;
    private String expID;
    private int groupID;

    public String getExpName() {
        return expName;
    }

    public void setExpName(String expName) {
        this.expName = expName;
    }

    public String getExpPwd() {
        return expPwd;
    }

    public void setExpPwd(String expPwd) {
        this.expPwd = expPwd;
    }

    public String getExpID() {
        return expID;
    }

    public void setExpID(String expID) {
        this.expID = expID;
    }

    public int getGroupID() {
        return groupID;
    }

    public void setGroupID(int groupID) {
        this.groupID = groupID;
    }
}