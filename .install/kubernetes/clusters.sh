#!/bin/bash

# dev/test
az aks get-credentials --resource-group nonprod-cluster-centralus --name aks-mm100-nonprod --subscription masteryinternal
az aks get-credentials --resource-group nonprod-cluster-eastus2 --name aks-ave4u-nonprod --subscription averitt
az aks get-credentials --resource-group nonprod-cluster-eastus2 --name aks-cgl60-nonprod --subscription cargill
az aks get-credentials --resource-group nonprod-cluster-eastus2 --name aks-cat7x-nonprod --subscription cat
az aks get-credentials --resource-group nonprod-cluster-eastus2 --name aks-co2yt-nonprod --subscription covenant
az aks get-credentials --resource-group nonprod-cluster-eastus2 --name aks-dg3nl-nonprod --subscription dollargeneral
az aks get-credentials --resource-group nonprod-cluster-eastus2 --name aks-hir3j-nonprod --subscription hirschbach
az aks get-credentials --resource-group nonprod-cluster-eastus2 --name aks-kdp5t-nonprod --subscription kdp
az aks get-credentials --resource-group nonprod-cluster-eastus2 --name aks-ls8fm-nonprod --subscription loadsmith
az aks get-credentials --resource-group nonprod-cluster-centralus --name aks-ml100-nonprod --subscription molo
az aks get-credentials --resource-group nonprod-cluster-eastus2 --name aks-pep5c-nonprod --subscription pepsi
az aks get-credentials --resource-group nonprod-cluster-centralus --name aks-pr100-nonprod --subscription prime
az aks get-credentials --resource-group nonprod-cluster-centralus --name aks-ru100-nonprod --subscription ruan
az aks get-credentials --resource-group nonprod-cluster-centralus --name aks-sn100-nonprod --subscription schneider
az aks get-credentials --resource-group nonprod-cluster-centralus --name aks-tm100-nonprod --subscription tmc
az aks get-credentials --resource-group nonprod-cluster-centralus --name aks-tb100-nonprod --subscription trailerbridge
az aks get-credentials --resource-group nonprod-cluster-centralus --name aks-we100-nonprod --subscription werner

# production
az aks get-credentials --resource-group prod-cluster-centralus --name aks-ave4u-prod --subscription averitt
az aks get-credentials --resource-group prod-cluster-centralus --name aks-cgl60-prod --subscription cargill
az aks get-credentials --resource-group prod-cluster-centralus --name aks-cat7x-prod --subscription cat
az aks get-credentials --resource-group prod-cluster-centralus --name aks-co2yt-prod --subscription covenant
az aks get-credentials --resource-group prod-cluster-centralus --name aks-eva9o-prod --subscription evans
az aks get-credentials --resource-group prod-cluster-centralus --name aks-hir3j-prod --subscription hirschbach
az aks get-credentials --resource-group prod-cluster-centralus --name aks-kdp5t-prod --subscription kdp
az aks get-credentials --resource-group prod-cluster-centralus --name aks-ls8fm-prod --subscription loadsmith
az aks get-credentials --resource-group prod-cluster-centralus --name aks-ml100-prod --subscription molo
az aks get-credentials --resource-group prod-cluster-centralus --name aks-pr100-prod --subscription prime
az aks get-credentials --resource-group prod-cluster-centralus --name aks-ru100-prod --subscription ruan
az aks get-credentials --resource-group prod-cluster-centralus --name aks-sn100-prod --subscription schneider
az aks get-credentials --resource-group prod-cluster-centralus --name aks-tm100-prod --subscription tmc
az aks get-credentials --resource-group prod-cluster-centralus --name aks-tb100-prod --subscription trailerbridge
az aks get-credentials --resource-group prod-cluster-centralus --name aks-we100-prod --subscription werner

