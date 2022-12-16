import { LightningElement } from 'lwc';

export default class TemplateLooping extends LightningElement {

    fruits = ['Apple','Orange','Banana','Cikita','Grape'];

    accounts = [
        {
            id : 1,
            name: 'Abinash Panigrahi',
            title: 'Developer'
        },
        {
            id : 2,
            name: 'Mahmut Akyol',
            title: 'Admin'
        },
        {
            id : 3,
            name: 'Bekir',
            title: 'Rockstar'
        },
        {
            id : 4,
            name: 'Samet POLAT',
            title: 'Admin'
        }
    ]
}