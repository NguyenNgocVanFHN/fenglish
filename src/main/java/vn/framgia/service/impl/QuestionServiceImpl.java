package vn.framgia.service.impl;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

import org.hibernate.LockMode;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import vn.framgia.bean.QuestionInfo;
import vn.framgia.dao.QuestionDAO;
import vn.framgia.helper.QuestionConvertHelper;
import vn.framgia.model.Question;
import vn.framgia.service.LevelService;
import vn.framgia.service.QuestionService;
import vn.framgia.service.SubjectService;

public class QuestionServiceImpl extends BaseServiceImpl implements QuestionService {

	@Autowired
	QuestionDAO questionDAO;
	@Autowired
	SubjectService subjectService;
	@Autowired
	LevelService levelService;

	@Override
	public boolean createQuestion(Question question) {
		questionDAO.saveOrUpdate(question);
		return false;
	}

	@Override
	public boolean deleteQuestion(int id) {
		// TODO Auto-generated method stub
		try {
			Question lockEntity = questionDAO.findByIdUsingLock(id, LockMode.PESSIMISTIC_WRITE);
			questionDAO.delete(lockEntity);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}

	}

	@Override
	public Question editQuestion(Question question) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Question> searchBySubjectAndLevel(int subjectId, int levelId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Question findById(Serializable key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Question saveOrUpdate(Question entity) {
		try {
			Question lockEntity = questionDAO.findByIdUsingLock(entity.getId(), LockMode.PESSIMISTIC_WRITE);
			BeanUtils.copyProperties(entity, lockEntity);
			return questionDAO.saveOrUpdate(lockEntity);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public boolean delete(Question entity) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Long countListAll() {
		// TODO Auto-generated method stub
		return questionDAO.countListAll();
	}

	@Override
	public List<Question> listAll(int pageSize, int pageNumber) {
		// TODO Auto-generated method stub
		return questionDAO.listAll(pageSize, pageNumber);
	}

	@Override
	public Question findQuestionById(int id) {
		// TODO Auto-generated method stub
		return questionDAO.findQuestionById(id);
	}

	@Override
	public List<QuestionInfo> getListQuestionByIdExercise(Integer idExercise) {
		try {
			List<Question> questions = questionDAO.getQuestionByIdExercise(idExercise);
			return QuestionConvertHelper.convertListQuestionToListQuestionInfo(questions);
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}

	public QuestionInfo saveOrUpdate(QuestionInfo questionInfo) {
		try {
			if (questionInfo.getId() == null) {

				Question question = new Question();
				QuestionConvertHelper.copyValueQuestionInfoToQuestion(question, questionInfo);
				question.setSubject(subjectService.findById(questionInfo.getSubjectId()));
				question.setLevel(levelService.findById(questionInfo.getLevelId()));
				question.setDeleted(false);
				return QuestionConvertHelper.convertQuestionToQuestionInfo(questionDAO.saveOrUpdate(question));
			}
			Question question = questionDAO.findByIdUsingLock(questionInfo.getId(), LockMode.PESSIMISTIC_WRITE);
			QuestionConvertHelper.copyValueQuestionInfoToQuestion(question, questionInfo);
			question.setSubject(subjectService.findById(questionInfo.getSubjectId()));
			question.setLevel(levelService.findById(questionInfo.getLevelId()));
			return QuestionConvertHelper.convertQuestionToQuestionInfo(questionDAO.saveOrUpdate(question));
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public boolean saveListQuestion(List<Question> listQuestion) {
		try {
			if (listQuestion == null)
				return false;
			questionDAO.saveListQuestion(listQuestion);
			return true;
		} catch (Exception e) {
			throw e;
		}
	}

}
