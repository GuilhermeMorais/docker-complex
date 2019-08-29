#Docker Build
docker build -t glmsharp/complex-client:latest -t glmsharp/complex-client:$SHA -f ./client/Dockerfile ./client
docker build -t glmsharp/complex-server:latest -t glmsharp/complex-server:$SHA -f ./server/Dockerfile ./server
docker build -t glmsharp/complex-worker:latest -t glmsharp/complex-worker:$SHA -f ./worker/Dockerfile ./worker

#Docker Push LATEST
docker push glmsharp/complex-client:latest
docker push glmsharp/complex-server:latest
docker push glmsharp/complex-worker:latest

#Docker Push $SHA
docker push glmsharp/complex-client:$SHA
docker push glmsharp/complex-server:$SHA
docker push glmsharp/complex-worker:$SHA

#Create the Deployment environment.
kubectl apply -f k8s

#Force the new version
kubectl set image deployments/server-deployment server=glmsharp/complex-server:$SHA
kubectl set image deployments/worker-deployment worker=glmsharp/complex-worker:$SHA
kubectl set image deployments/client-deployment client=glmsharp/complex-client:$SHA