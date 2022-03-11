#include<stdio.h>
void main()
{
int incoming,outgoing,buff_size,n,store=0;
printf("enter the number of packet:");
scanf("%d",&n);
printf("\noutgoing");
scanf("%d",&outgoing);
printf("\n buffer size:");
scanf("%d",&buff_size);
while(n!=0)
{
printf("\n incomming packets:");
scanf("%d",&incoming);
if(incoming<=(buff_size-store))
{
store+=incoming;
}
else
{
printf("\n%d packet is dropped\n",incoming-(buff_size-store));
printf("Buffer size %d out of %d\n",store,buff_size);
store=buff_size;
}
store=store-outgoing;
printf("after outgoing %d packets left in buffer %d",store,buff_size);
n--;
}
}
