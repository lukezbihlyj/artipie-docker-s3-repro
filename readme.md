## Artipie Bug Repro for Issue 1456

1. Create a DigitalOcean account

2. Create a Spaces bucket in nyc3

3. Create a Spaces access key with secret key

4. Open `repo/_storages.yaml` and update the BUCKET_NAME, ACCESS_KEY and SECRET_KEY

5. Run `./run-artipie.sh` in one terminal

6. Run `./trigger-upload.sh` in another terminal

You should get the following output:

```
[+] Requesting upload UUID...
[+] Found UUID: ce0a9a72-5ea2-45af-b9af-f2514c36a790
[+] Uploading the image layer...
java.util.concurrent.CompletionException: java.lang.NullPointerException: Digest is not yet calculated.
java.util.concurrent.CompletionException: java.lang.NullPointerException: Digest is not yet calculated.
        at java.base/java.util.concurrent.CompletableFuture.encodeThrowable(CompletableFuture.java:315)
        at java.base/java.util.concurrent.CompletableFuture.completeThrowable(CompletableFuture.java:320)
        at java.base/java.util.concurrent.CompletableFuture$UniCompose.tryFire(CompletableFuture.java:1159)
        at java.base/java.util.concurrent.CompletableFuture.postComplete(CompletableFuture.java:510)
        at java.base/java.util.concurrent.CompletableFuture.complete(CompletableFuture.java:2179)
        at software.amazon.awssdk.core.internal.http.pipeline.stages.AsyncApiCallMetricCollectionStage.lambda$execute$0(AsyncApiCallMetricCollectionStage.java:58)
        at java.base/java.util.concurrent.CompletableFuture.uniWhenComplete(CompletableFuture.java:863)
        at java.base/java.util.concurrent.CompletableFuture$UniWhenComplete.tryFire(CompletableFuture.java:841)
        at java.base/java.util.concurrent.CompletableFuture.postComplete(CompletableFuture.java:510)
        at java.base/java.util.concurrent.CompletableFuture.complete(CompletableFuture.java:2179)
        at software.amazon.awssdk.core.internal.http.pipeline.stages.AsyncApiCallTimeoutTrackingStage.lambda$execute$2(AsyncApiCallTimeoutTrackingStage.java:69)
        at java.base/java.util.concurrent.CompletableFuture.uniWhenComplete(CompletableFuture.java:863)
        at java.base/java.util.concurrent.CompletableFuture$UniWhenComplete.tryFire(CompletableFuture.java:841)
        at java.base/java.util.concurrent.CompletableFuture.postComplete(CompletableFuture.java:510)
        at java.base/java.util.concurrent.CompletableFuture.complete(CompletableFuture.java:2179)
        at software.amazon.awssdk.core.internal.http.pipeline.stages.AsyncRetryableStage$RetryingExecutor.lambda$attemptExecute$1(AsyncRetryableStage.java:177)
        at java.base/java.util.concurrent.CompletableFuture.uniWhenComplete(CompletableFuture.java:863)
        at java.base/java.util.concurrent.CompletableFuture$UniWhenComplete.tryFire(CompletableFuture.java:841)
        at java.base/java.util.concurrent.CompletableFuture.postComplete(CompletableFuture.java:510)
        at java.base/java.util.concurrent.CompletableFuture.complete(CompletableFuture.java:2179)
        at software.amazon.awssdk.core.internal.http.pipeline.stages.MakeAsyncHttpRequestStage.lambda$execute$0(MakeAsyncHttpRequestStage.java:110)
        at java.base/java.util.concurrent.CompletableFuture.uniWhenComplete(CompletableFuture.java:863)
        at java.base/java.util.concurrent.CompletableFuture$UniWhenComplete.tryFire(CompletableFuture.java:841)
        at java.base/java.util.concurrent.CompletableFuture.postComplete(CompletableFuture.java:510)
        at java.base/java.util.concurrent.CompletableFuture.complete(CompletableFuture.java:2179)
        at software.amazon.awssdk.core.internal.http.pipeline.stages.MakeAsyncHttpRequestStage.completeResponseFuture(MakeAsyncHttpRequestStage.java:253)
        at software.amazon.awssdk.core.internal.http.pipeline.stages.MakeAsyncHttpRequestStage.lambda$executeHttpRequest$3(MakeAsyncHttpRequestStage.java:167)
        at java.base/java.util.concurrent.CompletableFuture.uniHandle(CompletableFuture.java:934)
        at java.base/java.util.concurrent.CompletableFuture$UniHandle.tryFire(CompletableFuture.java:911)
        at java.base/java.util.concurrent.CompletableFuture$Completion.run(CompletableFuture.java:482)
        at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1144)
        at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:642)
        at java.base/java.lang.Thread.run(Thread.java:1583)
Caused by: java.lang.NullPointerException: Digest is not yet calculated.
        at java.base/java.util.Objects.requireNonNull(Objects.java:259)
        at com.artipie.docker.misc.DigestedFlowable.digest(DigestedFlowable.java:67)
        at com.artipie.docker.asto.AstoUpload.lambda$append$2(AstoUpload.java:108)
        at java.base/java.util.concurrent.CompletableFuture$UniCompose.tryFire(CompletableFuture.java:1150)
        ... 30 more
```
