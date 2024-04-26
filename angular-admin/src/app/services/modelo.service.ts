import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ListModelosNoPage } from '../models/list-modelos-no-page.interface';
import { environment } from '../environment/environment';
import { ListModelos } from '../models/list-modelos-paginacion.interface';
import { ModeloDetails } from '../models/new-modelo.interface';

@Injectable({
  providedIn: 'root'
})
export class ModeloService {

  constructor(private http: HttpClient) { }

  listModelosWithOutPage(): Observable<ListModelosNoPage[]> {
    return this.http.get<ListModelosNoPage[]>(`${environment.apiBaseUrl}/admin/modelo/no-page`,
      {
        headers: {
          'Authorization': `Bearer ${localStorage.getItem('token')}`
        }
      });
  }

  listModelos(page: number): Observable<ListModelos> {
    return this.http.get<ListModelos>(`${environment.apiBaseUrl}/admin/modelo?page=${page}`,
      {
        headers: {
          'Authorization': `Bearer ${localStorage.getItem('token')}`
        }
      });
  }

  create(logo: string, modelo: string): Observable<ModeloDetails> {
    return this.http.post<ModeloDetails>(`${environment.apiBaseUrl}/admin/add/modelo`,
      {
        logo: logo,
        modelo: modelo
      }, {
      headers: {
        'Authorization': `Bearer ${localStorage.getItem('token')}`
      }
    });
  }

  edit(logo: string, modelo: string, id: string): Observable<ModeloDetails> {
    return this.http.put<ModeloDetails>(`${environment.apiBaseUrl}/admin/edit/modelo/${id}`,
      {
        logo: logo,
        modelo: modelo
      }, {
      headers: {
        'Authorization': `Bearer ${localStorage.getItem('token')}`
      }
    }
    );
  }
}
