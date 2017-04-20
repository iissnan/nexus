import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SharedModule } from '../shared/shared.module';
import { MatchesComponent } from './matches.component';

@NgModule({
  imports: [
    CommonModule,
    SharedModule
  ],
  declarations: [MatchesComponent],
  exports: [ MatchesComponent ]
})
export class MatchesModule { }
