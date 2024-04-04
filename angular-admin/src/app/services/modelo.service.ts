import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ListModelosNoPage } from '../models/list-modelos-no-page.interface';
import { environment } from '../environment/environment';

@Injectable({
  providedIn: 'root'
})
export class ModeloService {

  constructor(private http: HttpClient) { }

  listModelosWithOutPage(): Observable<ListModelosNoPage[]>{
    return this.http.get<ListModelosNoPage[]>(`${environment.apiBaseUrl}/admin/modelo/no-page`,
    {
      headers: {
        'Authorization': `Bearer ${localStorage.getItem('token')}`
      }
    })
  }
}
