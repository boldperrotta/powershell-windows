function New-RandomPassword {
$alpha = ‘a,b,c,d,e,f,g,h,j,k,m,n,p,q,r,s,t,u,v,w,x,y,z’
$numbers = 2..9

$array = @()
$array+= $alpha.Split(‘,’) | Get-Random -Count 6
$array[0] = $array[0].ToUpper()
$array+= $numbers | Get-Random -Count 4
($array) -join ""
}
