import { Component, TemplateRef } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-modelos-page',
  templateUrl: './modelos-page.component.html',
  styleUrl: './modelos-page.component.css'
})
export class ModelosPageComponent {

  constructor(private modalService: NgbModal) {}

  crear(){
    
  }

	openBackDropCustomClass(content: TemplateRef<any>) {
		this.modalService.open(content, { backdropClass: 'light-blue-backdrop' });
	}

}
