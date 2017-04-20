import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SharedModule } from '../shared/shared.module';
import { TeamsComponent } from './teams.component';

@NgModule({
  imports: [
    CommonModule,
    SharedModule
  ],
  declarations: [ TeamsComponent ],
  exports: [ TeamsComponent ]
})
export class TeamsModule { }
