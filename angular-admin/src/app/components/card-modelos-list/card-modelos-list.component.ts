import { Component, OnInit, TemplateRef } from '@angular/core';
import { Modelo } from '../../models/list-modelos-paginacion.interface';
import { ModeloService } from '../../services/modelo.service';
import { Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-card-modelos-list',
  templateUrl: './card-modelos-list.component.html',
  styleUrl: './card-modelos-list.component.css'
})
export class CardModelosListComponent implements OnInit {
  modelosList!: Modelo[];
  idModelo!: string;

  totalModelos = 0;
  modelosPorPagina = 0;
  pagina = 0;

  constructor(private service: ModeloService, private router: Router, private modalService: NgbModal) { }

  ngOnInit(): void {
    this.loadPage();

  }

  loadPage(): void {
    window.scrollTo(0, 0);
    this.service.listModelos(this.pagina - 1).subscribe(resp => {
      this.modelosList = resp.content;
      this.modelosPorPagina = resp.pageable.pageSize;
      this.totalModelos = resp.totalElements;
    });
  }

  modelo(idModelo: string) {
    this.router.navigate([`/admin/modelo/${idModelo}`]);
  }
}
