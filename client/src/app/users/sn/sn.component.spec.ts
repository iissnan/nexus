import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SnComponent } from './sn.component';

describe('SnComponent', () => {
  let component: SnComponent;
  let fixture: ComponentFixture<SnComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SnComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SnComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
