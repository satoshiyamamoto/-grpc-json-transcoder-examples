package helloworld;

import helloworld.GreeterGrpc.GreeterImplBase;
import io.grpc.stub.StreamObserver;
import net.devh.boot.grpc.server.service.GrpcService;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application {
  public static void main(String[] args) {
    SpringApplication.run(Application.class, args);
  }

  @GrpcService
  public static class GreeterImpl extends GreeterImplBase {

    @Override
    public void sayHello(HelloRequest request, StreamObserver<HelloReply> responseObserver) {
      final var reply =
          HelloReply.newBuilder().setMessage("Hello " + request.getName() + " from Java").build();
      responseObserver.onNext(reply);
      responseObserver.onCompleted();
    }
  }
}
