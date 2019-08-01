pipeline {
    agent { label 'env01jnk.example.dom'}
    stages {
        stage('clone terraform repo'){
            steps {
                git branch: 'master',
                credentialsId: '00000000-2773-498b-b579-739867894371',
                url: 'ssh://ssh@stash.example.dom/ops/terraform.git'
            }
        }
        stage('apply jenkins params'){
            steps{
                withEnv(['PATH+EXTRA=/usr/sbin:/usr/bin:/sbin:/bin']) {
                      sh '''
                         cd ./devtest/devtest_jenkins_pipeline/
                         echo "vsphere_vm_name      = \\"${nodename}\\"" >> terraform.tfvars
                         echo "vsphere_vcpu_number  = ${cpus}" >> terraform.tfvars                
                         echo "vsphere_memory_size  = ${memory}" >> terraform.tfvars
                         echo "vsphere_port_group   = \\"${port_group}\\"" >> terraform.tfvars
                         echo "vsphere_datastore    = \\"${Datastore}\\""  >> terraform.tfvars
                         echo "vsphere_ipv4_address = \\"${IP_Address}\\"" >> terraform.tfvars
                         echo "vsphere_ipv4_gateway = \\"${IP_Gateway}\\"" >> terraform.tfvars
                         '''
                    }
            }
        }
        stage('terraform init'){
            steps{
                withEnv(['PATH+EXTRA=/usr/sbin:/usr/bin:/sbin:/bin']) {
                    sh '''
                        cd ./devtest/devtest_jenkins_pipeline/
                        sed -i 's/^[[:space:]]*//g' terraform.tfvars
                        cat ./terraform.tfvars
                        terraform init
                        terraform plan -out=jenkins-out
                       '''
                }
            }
        }
        stage('terraform apply'){
            steps{
                withEnv(['PATH+EXTRA=/usr/sbin:/usr/bin:/sbin:/bin']) {
                    sh '''
                    cd ./devtest/devtest_jenkins_pipeline/
                    terraform apply -no-color -input=false -auto-approve=true -lock=true jenkins-out
                    '''
                }
            }
        }
        stage('terraform amnesiac'){
            steps{ 
                withEnv(['PATH+EXTRA=/usr/sbin:/usr/bin:/sbin:/bin']) {
                    sh  '''
                        cd ./devtest/devtest_jenkins_pipeline/
                        rm terraform.tfstate
                        '''
                }
            }
        }
        stage('move to environment folder'){
            steps{ 
                withEnv(['PATH+EXTRA=/usr/sbin:/usr/bin:/sbin:/bin']) {
                    sh  '''
                        cd ./devtest/devtest_jenkins_pipeline/ansible
                        echo "vsphere_vm_name: \\"${nodename}\\"" >> ./group_vars/vsphere
                        echo "vsphere_vm_folder: \\"${vsphere_vm_folder}\\"" >> ./group_vars/vsphere
                        ansible-playbook move_to_folder.yml
                        echo "[+] cleaning up"
                        sed -i '/vsphere_vm_name/d' ./group_vars/vsphere
                        sed -i '/vsphere_vm_folder/d' ./group_vars/vsphere
                        '''
                }
            }
        }
    }
}
