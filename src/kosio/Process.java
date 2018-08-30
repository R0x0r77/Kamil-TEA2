package kosio;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import kosio.dto.MenuItem;
import kosio.dto.User;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

public class Process {

	@SuppressWarnings("unchecked")
	public List<MenuItem> getMenuPage(int menuPage) {
		
		SessionFactory factory = new Configuration().configure().buildSessionFactory();
		Session session = factory.openSession();
		session.beginTransaction();
		
		Query query = session.createQuery("FROM MenuItem WHERE pageId = :menuPage")
				.setParameter("menuPage", menuPage);
		
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<MenuItem> getDesserts() {
		
		SessionFactory factory = new Configuration().configure().buildSessionFactory();
		Session session = factory.openSession();
		session.beginTransaction();
		
		Query query = session.createQuery("FROM MenuItem WHERE pageId = 4");
		
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<MenuItem> getDrinks() {
		
		SessionFactory factory = new Configuration().configure().buildSessionFactory();
		Session session = factory.openSession();
		session.beginTransaction();
		
		Query query = session.createQuery("FROM MenuItem WHERE pageId = 5");
		
		return query.list();
	}
	
	
	public User getUserFromDB(String userName) {
		
		User user;
		
		SessionFactory factory = new Configuration().configure().buildSessionFactory();
		Session session = factory.openSession();
		session.beginTransaction();
		
		
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
		CriteriaQuery<User> query = criteriaBuilder.createQuery(User.class);
		Root<User> root = query.from(User.class);
		query.select(root);
		query.where(criteriaBuilder.equal(root.get("loginName"), userName));

		Query<User> q = session.createQuery(query);
		List<User> list = q.getResultList();
		
		
		session.close();
		
		if (list.size() > 0)
			user = list.get(0);
		else
			user = new User();
		
		return user;
	}
	
	public void createNewAccount(String loginName, String firstName, String lastName, String password) {
		
		User user = new User();
		
		user.setLoginName(loginName);
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setPassword(password);
		
		
		SessionFactory factory = new Configuration().configure().buildSessionFactory();
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		
		session.persist(user);
		
		transaction.commit();
	}

}