import { LightningElement, api, wire } from 'lwc';
import { fireEvent } from 'c/pubsub';
import { CurrentPageReference, NavigationMixin } from 'lightning/navigation';

export default class TreeCard extends NavigationMixin(LightningElement) {
    
    @api treeName;
    @api treeId;
    @api treeBenefits;
    @api treePicture;

    @wire(CurrentPageReference) pageRef;


    showTreeLocations(){
        fireEvent(this.pageRef, 'treeclick', this.treeId);
    }

    navigateToRecord(){
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.treeId,
                objectApiName: 'Tree__c',
                actionName: 'view'
            }
        });
    }
}