import { Component, OnInit, TemplateRef } from '@angular/core';
import { Modelo } from '../../models/list-modelos-paginacion.interface';
import { ModeloService } from '../../services/modelo.service';
import { Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { FileService } from '../../services/file.service';

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

  logo!: string;

  constructor(private service: ModeloService, private router: Router, 
    private modalService: NgbModal, private fileService: FileService) { }

  ngOnInit(): void {
    this.loadPage();
  }

  loadPage(): void {
    window.scrollTo(0, 0);
    this.service.listModelos(this.pagina - 1).subscribe(resp => {
      this.modelosList = resp.content;
      this.modelosPorPagina = resp.pageable.pageSize;
      this.totalModelos = resp.totalElements;
      this.modelosList.forEach(modelo => {
        this.loadImage(modelo);
      });
    });
  }

  modelo(idModelo: string) {
    this.router.navigate([`/admin/modelo/${idModelo}`]);
  }

  loadImage(modelo: Modelo): void {
    this.fileService.getFile(modelo.logo).subscribe((blob: Blob) => {
      const objectUrl = URL.createObjectURL(blob);
      modelo.logo = objectUrl;
    });
  }
}
