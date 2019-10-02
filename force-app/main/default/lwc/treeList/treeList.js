import { LightningElement, wire } from 'lwc';
import getAllTrees from '@salesforce/apex/TreeListController.getAllTrees';

export default class TreeList extends LightningElement {

    @wire (getAllTrees)
    allTree;
}