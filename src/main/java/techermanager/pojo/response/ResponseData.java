package techermanager.pojo.response;


import java.util.List;

public class ResponseData<T> {
    private Integer code;
    private String msg;
    private Long count;
    private T data;


    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public ResponseData( T data) {
        this.code = 0;
        this.msg = "上传成功,请提交";
        this.data = data;
    }
}

