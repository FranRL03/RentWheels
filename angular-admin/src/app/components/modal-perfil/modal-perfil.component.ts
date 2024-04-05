import { Component, ElementRef, Input, ViewChild } from '@angular/core';
import { LoginResponse } from '../../models/login.interface';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Router } from '@angular/router';
import { UserDetailsResponse } from '../../models/user-details';

@Component({
  selector: 'app-modal-perfil',
  templateUrl: './modal-perfil.component.html',
  styleUrl: './modal-perfil.component.css'
})
export class ModalPerfilComponent {

  @ViewChild('modal') modal!: ElementRef;
  @Input() admin!: UserDetailsResponse;
  avatar!: string;  

  constructor(private modalService: NgbModal, private route: Router) {}

  open(modal: any){
    this.avatar = this.admin.avatar;
    this.modalService.open(modal, {
      keyboard: false,
      size: 'sm',
      backdrop: false,
      scrollable: false
    });
  }

  logout() {
    localStorage.clear();
    this.modalService.dismissAll('Cerrar sesión')
    this.route.navigateByUrl('/login');
  }

}
