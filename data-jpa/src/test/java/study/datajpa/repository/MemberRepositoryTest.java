package study.datajpa.repository;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import study.datajpa.domain.Member;
import study.datajpa.domain.Team;
import study.datajpa.dto.MemberDto;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@SpringBootTest
@Transactional
@Rollback(value = false)
public class MemberRepositoryTest {
    @Autowired
    MemberRepository memberRepository;

    @PersistenceContext
    EntityManager em;

    @Test
    public void testMember() {
        Member member = new Member("memberA");
        Member savedMember = memberRepository.save(member);

        Member findMember = memberRepository.findById(savedMember.getId()).get();
        Assertions.assertThat(member.getId()).isEqualTo(findMember.getId());
        Assertions.assertThat(member.getUsername()).isEqualTo(findMember.getUsername());
        Assertions.assertThat(member).isEqualTo(findMember);
    }

    @Test
    public void testMemberName() {
        Member member = new Member("memberA", 100);
        Member savedMember =  memberRepository.save(member);
        Member findMember = memberRepository.findByUsername(savedMember.getUsername()).get(0);
        Assertions.assertThat(member.getId()).isEqualTo(findMember.getId());
        Assertions.assertThat(member.getUsername()).isEqualTo(findMember.getUsername());
        Assertions.assertThat(member).isEqualTo(findMember);

    }

    @Test
    public void testFindusernameList() {
        Team team1 = new Team("red");
        Team team2 = new Team("blue");
        em.persist(team1);
        em.persist(team2);
        Member member1 = new Member("memberA", 100, team1);
        Member member2 = new Member("memberB", 12, team2);


        memberRepository.save(member1);
        memberRepository.save(member2);
        List<String> memberList = memberRepository.findUsernameList();
        Assertions.assertThat(memberList.get(0)).isEqualTo("memberA");
        Assertions.assertThat(memberList.size()).isEqualTo(2);
        Assertions.assertThat(memberList.get(1)).isEqualTo("memberB");
    }
    @Test
    public void testFindMemberDto() {
        Team team1 = new Team("red");
        Team team2 = new Team("blue");
        em.persist(team1);
        em.persist(team2);
        Member member1 = new Member("memberA", 100, team1);
        Member member2 = new Member("memberB", 12, team2);
        memberRepository.save(member1);
        memberRepository.save(member2);
        List<MemberDto> memberDtoList = memberRepository.findMemberDto();
        for (MemberDto memberDto : memberDtoList) {
            System.out.println("memberDto = " + memberDto);
        }
    }
}
