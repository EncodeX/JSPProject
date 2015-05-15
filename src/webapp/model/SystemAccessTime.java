package webapp.model;

import java.util.Date;

/**
 * Created by zz on 2015/4/28.
 */
public class SystemAccessTime {
    private String type;
    private Date starttime;
    private Date endtime;
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

}
