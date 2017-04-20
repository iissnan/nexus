import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { FormsModule } from "@angular/forms";
import { SharedModule } from '../shared/shared.module';
import { UsersComponent } from './users.component';
import { UserComponent } from './user/user.component';
import { SnComponent } from './sn/sn.component';


@NgModule({
  imports: [
    CommonModule,
    RouterModule,
    FormsModule,
    SharedModule
  ],
  declarations: [
    UsersComponent,
    UserComponent,
    SnComponent
  ]
})
export class UsersModule { }
