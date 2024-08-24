Create the helmchart
helm create webapp

Install the first one
helm install webapp-release webapp/ --values webapp/values.yaml

Create qa/prd
kubectl create namespace qa
kubectl create namespace prd

helm install webapp-release-qa webapp/ --values webapp/values.yaml -f webapp/values-qa.yaml -n qa
helm install webapp-release-prd webapp/ --values webapp/values.yaml -f webapp/values-prd.yaml -n prd

helm upgrade webapp-release-qa webapp/ --values webapp/values.yaml -f webapp/values-qa.yaml -n qa
helm upgrade webapp-release-prd webapp/ --values webapp/values.yaml -f webapp/values-prd.yaml -n prd

helm ls --all-namespaces
