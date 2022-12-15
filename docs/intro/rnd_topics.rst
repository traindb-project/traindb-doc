TrainDB's Main R&D Topics
=========================

#. `TrainDB: an ML-model based approximate query processing engine <https://github.com/traindb-project/traindb>`_

   * SQL-like approximate query language
   * Approximate query processing using synopsis data that are synthesized by ML models
   * Approximate query processing using ML inference models
   * Various DBMS data sources support via extensible data source adapters

#. `ML model library for approximate query processing <https://github.com/traindb-project/traindb-model>`_

   * Synopsis generative ML models + inferential ML models

     * Synopsis generative ML models: GAN-based models(e.g., TableGAN, OCT-GAN), score-based generative models
     * Inferential ML models: mixture density networks(MDN), relational sum-product networks(RSPN)

   * Error estimation for approximate query evaluation
   * Continual learning to update base table changes

#. `Cloud ML model serving framework <https://github.com/traindb-project/traindb-ml>`_

   * A framework for training/serving ML models in remote GPU servers
   * Kubeflow-based ML model registry/training/serving support

#. `Visual Exploratory Data Analysis Support Tools for TrainDB <https://github.com/traindb-project/aqp-tav>`_

   * Approximation query result visualization for exploratory data analysis
   * Visual OLAP analysis support for multi-dimensional data analysis
