import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginPageComponent } from './ui/login-page/login-page.component';
import { CochesPageComponent } from './ui/coches-page/coches-page.component';
import { NoAdminComponent } from './ui/no-admin/no-admin.component';

const routes: Routes = [
  { path: 'login', component: LoginPageComponent },
  { path: 'coche', component: CochesPageComponent},
  { path: 'no-admin', component: NoAdminComponent},
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: '**', component: LoginPageComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
