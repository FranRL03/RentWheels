import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavComponent } from './components/nav/nav.component';
import { LoginPageComponent } from './ui/login-page/login-page.component';
import { CochesPageComponent } from './ui/coches-page/coches-page.component';
import { NoAdminComponent } from './ui/no-admin/no-admin.component';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { ModalPerfilComponent } from './components/modal-perfil/modal-perfil.component';
import { AdminSectionComponent } from './section/admin-section/admin-section.component';

@NgModule({
  declarations: [
    AppComponent,
    NavComponent,
    LoginPageComponent,
    CochesPageComponent,
    NoAdminComponent,
    ModalPerfilComponent,
    AdminSectionComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    NgbModule, 
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
