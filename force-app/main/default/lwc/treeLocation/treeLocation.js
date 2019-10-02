import { LightningElement, wire, track } from 'lwc';
import getTreeLocations from '@salesforce/apex/TreeLocationController.getTreeLocations';
import { registerListener, unregisterAllListeners } from 'c/pubsub';
import { CurrentPageReference } from 'lightning/navigation';

export default class TreeLocation extends LightningElement {
    @track mapMarkers = [];

    @track treeId;

    @wire(CurrentPageReference) pageRef;
    @wire (getTreeLocations, { treeId: '$treeId' })
    wrappedResult( {data} ){
        if(data && data.length){
            this.generateMarkers(data);
        }
    }

    connectedCallback(){
        registerListener('treeclick', (payload) => {this.treeId = payload;}, this);
    }

    disconnectedCallback(){
        unregisterAllListeners(this);
    }

    generateMarkers(data){
        const mapMarkers = [];
        data.forEach(item => {
            const marker = {
                location : {
                    Latitude : item.Planted_In__r.Location__Latitude__s,
                    Longitude : item.Planted_In__r.Location__Longitude__s
                },
                title : item.Planted_In__r.Name
            };
            mapMarkers.push(marker);
        });
        this.mapMarkers = mapMarkers;
    }

    get showComponent(){
        return this.mapMarkers && this.mapMarkers.length ? true : false;
    }
}