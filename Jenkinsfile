pipeline {
  agent any
  triggers {
    pollSCM '*/5 * * * *'
  }
  stages {
    stage('Build') {
      steps {
        sh '''
          cp -r . /root/home/
          cd /root/home
          ls
          docker-compose up -d
        '''
      }
    }
    stage('Test') {
      steps {
        sh '''
          cp -r . /root/home/
          cd /root/home
          ls
          apt update
          apt install -y python3 python3-pip python3-venv
          python3 -m venv /venv
          . /venv/bin/activate
          pip install pytest selenium
          docker-compose up -d
          sleep 15
          python pytest.py
        '''
      }
    }
    stage('Deliver') {
      steps {
        sh 'echo "Ready to deliver"'
      }
    }
  }
}
