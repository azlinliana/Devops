# Generated by Selenium IDE
import pytest
import time
import json
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

class TestAddaname():
  def setup_method(self, method):
    self.driver = webdriver.Firefox()
    self.vars = {}
  
  def teardown_method(self, method):
    self.driver.quit()
  
  def test_add_a_name(self):
    self.driver.get("http://localhost:4000/")
    self.driver.set_window_size(550, 691)
    self.driver.find_element(By.CSS_SELECTOR, "input").click()
    self.driver.find_element(By.CSS_SELECTOR, "input").send_keys("Name 1")
    self.driver.find_element(By.CSS_SELECTOR, "button").click()
    self.driver.find_element(By.CSS_SELECTOR, "tr:nth-child(3) > td:nth-child(2)").click()
    self.driver.find_element(By.CSS_SELECTOR, "tr:nth-child(2) > td:nth-child(2)").click()
