package webapp.model;

/**
 * Created by zz on 2015/5/28.
 */
public class Committee {
    Expert expert;
    int alreadyVote;
    int limitVote;

    public Committee(Expert expert, int alreadyVote, int limitVote) {
        this.expert = expert;
        this.alreadyVote = alreadyVote;
        this.limitVote = limitVote;
    }

    public Expert getExpert() {
        return expert;
    }

    public void setExpert(Expert expert) {
        this.expert = expert;
    }

    public int getAlreadyVote() {
        return alreadyVote;
    }

    public void setAlreadyVote(int alreadyVote) {
        this.alreadyVote = alreadyVote;
    }

    public int getLimitVote() {
        return limitVote;
    }

    public void setLimitVote(int limitVote) {
        this.limitVote = limitVote;
    }
}
