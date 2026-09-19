import { LightningElement, api } from 'lwc';
import {loadScript} from "lightning/platformResourceLoader";
import docxImport from "@salesforce/resourceUrl/Docx";
import AccountGrab from "@salesforce/apex/AccountDetailsGenerate.getAccountdetails";


export default class AccountListGenerat extends LightningElement {

    @api recordId;
    downloadURL;

    _no_border = {top: {style: "none", size: 0, color: "FFFFFF"},
	bottom: {style: "none", size: 0, color: "FFFFFF"},
	left: {style: "none", size: 0, color: "FFFFFF"},
	right: {style: "none", size: 0, color: "FFFFFF"}};

    connectedCallback(){
        Promise.all([loadScript(this, docxImport)]).then(() =>{
           this.renderButtons();
        });
         }

         renderButtons(){
            this.template.querySelector(".hidden").classList.add("not_hidden");
            this.template.querySelector(".hidden").classList.remove("hidden");
         }

         startDocumentGeneration(){
            AccountGrab({'acctId': this.recordId}).then(accounts=> {
                this.buildDocument(accounts);
            });
         }

         buildDocument(accountsPassed){
            let document = new docx.Document();
            let tableCells = [];
            tableCells.push(this.generateHeaderRow());
            
            accountsPassed.forEach(account => {
                tableCells.push(this.generateRow(account));
            });

            this.generateTable(document, tableCells);
            this.generateDownloadLink(document);

         }
        
         generateHeaderRow(){
            let tableHeaderRow = new docx.TableRow({
                 children:[
                           new docx.TableCell({
                            children: [new docx.Paragraph("Account Name")],
                            borders: this._no_border
                           }),
                           new docx.TableCell({
                            children: [new docx.Paragraph("Type")],
                            borders: this._no_border
                           }),
                           new docx.TableCell({
                            children: [new docx.Paragraph("Rating")],
                            borders: this._no_border
                           })
                 ]
            });
            return tableHeaderRow;
         }
         
         generateRow(accountPassed){
            console.log("accountPassed");
            console.log(accountPassed);
            let tableRow = new docx.TableRow({
                children: [
                     new docx.TableCell({
                        children:[new docx.Paragraph({children: [this.generateTextRun(accountPassed["Name"].toString())]})],
                        borders: this._no_border
                     }),
                     new docx.TableCell({
                        children:[new docx.Paragraph({children: [this.generateTextRun(accountPassed["Type"].toString())]})],
                        borders: this._no_border
                     }),
                     new docx.TableCell({
                        children:[new docx.Paragraph({children: [this.generateTextRun(accountPassed["Rating"].toString())]})],
                        borders: this._no_border
                     })
                ]
            });
              return tableRow;
         }
          
         generateTextRun(cellString){
                  let textRun = new docx.TextRun({text: cellString, bold: true,size: 48, font: "Calibri"});
                  return textRun;
         }
         generateTable(documentPassed, tableCellsPassed){
                 let docTable = new docx.Table({
                    rows: tableCellsPassed
                 });

                 documentPassed.addSection({
                    children: [docTable]
                 });
         }

         generateDownloadLink(documentPassed){
            docx.Packer.toBase64String(documentPassed).then(textBlob =>{
              this.downloadURL = 'data:application/vnd.openxmlformats-officedocument.wordprocessingml.document;base64,' + textBlob;
              this.template.querySelector(".slds-hide").classList.remove("slds-hide");
            });
         }
}