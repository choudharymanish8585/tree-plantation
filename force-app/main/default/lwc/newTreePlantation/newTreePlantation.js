import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class NewTreePlantation extends LightningElement {

    @track recordId;
    @track showForm = false;

    recordNewPlantation(){
        this.showForm = true;
        this.recordId = undefined;
    }

    handleSuccess(event) {
        const evt = new ShowToastEvent({
            title: "Plantation Recorded",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(evt);
    }

    get mode(){
        return this.recordId ? 'view' : 'edit';
    }
}