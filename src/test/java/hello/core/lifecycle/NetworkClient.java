package hello.core.lifecycle;

public class NetworkClient {

    private String url;

    public NetworkClient(String url) {
        System.out.println("생성자 호출, url = " + url);
        connect();
        call("초기화 연결 메시지");
    }

    public void setUrl(String url) {
        this.url = url;
    }

    //서비스 시작시 호출
    public void connect() {
        System.out.println("Connecting to " + url);
    }

    public void call(String message) {
        System.out.println("Calling " + url + " message = " + message);
    }

    //서비스 종료 시 호출
    public void disconnect() {
        System.out.println("Disconnecting from " + url);
    }
}
