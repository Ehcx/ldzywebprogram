package entity;

public class Step {
    private Integer step_no;
    private String step_name;
    private Integer limit_time;
    private String step_des;
    private String url;

    @Override
    public String toString() {
        return "Step{" +
                "step_no=" + step_no +
                ", step_name='" + step_name + '\'' +
                ", limit_time=" + limit_time +
                ", step_des='" + step_des + '\'' +
                ", url='" + url + '\'' +
                '}';
    }

    public Integer getStep_no() {
        return step_no;
    }

    public void setStep_no(Integer step_no) {
        this.step_no = step_no;
    }

    public String getStep_name() {
        return step_name;
    }

    public void setStep_name(String step_name) {
        this.step_name = step_name;
    }

    public Integer getLimit_time() {
        return limit_time;
    }

    public void setLimit_time(Integer limit_time) {
        this.limit_time = limit_time;
    }

    public String getStep_des() {
        return step_des;
    }

    public void setStep_des(String step_des) {
        this.step_des = step_des;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
