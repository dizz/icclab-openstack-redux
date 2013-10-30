
node /ctl.cloudcomplab.dev/ {

	class {'icclab::controller': }
}	

node /cmp.cloudcomplab.dev/ {

	class {'icclab::compute': }
}
